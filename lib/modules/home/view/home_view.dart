import 'dart:convert';
import 'dart:io';

import 'package:animations/animations.dart';
import 'package:dev_hack2/domain/models/club.dart';
import 'package:dev_hack2/domain/models/event.dart';
import 'package:dev_hack2/domain/services/services.dart';
import 'package:dev_hack2/main.dart';
import 'package:dev_hack2/modules/app/bloc/loading_cubit.dart';
import 'package:dev_hack2/modules/home/cubit/home_cubit.dart';
import 'package:dev_hack2/modules/home/widgets/clubs_view.dart';
import 'package:dev_hack2/modules/home/widgets/main_view.dart';
import 'package:dev_hack2/modules/home/widgets/profile_view.dart';
import 'package:dev_hack2/widgets/image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class HomeView extends StatefulWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with SingleTickerProviderStateMixin {
  late PageController _controller;
  int _index = 0;

  final _pages = <Widget>[MainView(), ClubsView(), ProfileView()];

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: PageView.builder(
            itemCount: _pages.length,
            itemBuilder: (context, index) {
              _index = index;
              return _pages[index];
            },
            controller: _controller,
            allowImplicitScrolling: false,
            physics: NeverScrollableScrollPhysics(),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Theme.of(context).primaryColor,
          currentIndex: _index,
          onTap: (index) {
            setState(() {
              _index = index;
            });
            _controller.jumpToPage(index);
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Главная'),
            BottomNavigationBarItem(icon: Icon(Icons.layers), label: 'Клубы'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Профиль'),
          ],
        ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class AddEvent extends StatefulHookWidget {
  const AddEvent(
      {required this.club, Key? key, required this.action, required this.bloc})
      : super(key: key);

  final Club club;
  final VoidCallback action;
  final EventCubit bloc;

  @override
  _AddEventState createState() => _AddEventState();
}

class _AddEventState extends State<AddEvent> with TickerProviderStateMixin {
  final _storage = GetIt.I<FirebaseStorageService>();
  List<bool> _selections = [true, false];
  String _durationText = '1 день';
  List<_SendingAttachment> _images = [];
  final _picker = ImagePicker();
  TextEditingController _controller = TextEditingController();
  TextEditingController _nameController = TextEditingController();

  Event _event = Event(
      id: null,
      clubs: [],
      location: '',
      periodic: Duration(days: 7).inHours,
      duration: Duration(days: 1).inHours,
      type: EventType.training,
      attachment: null,
      name: 'Тренировка',
      date: DateTime.now());

  @override
  void initState() {
    setState(() {
      _event = _event.copyWith(clubs: [widget.club.name]);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).canvasColor,
        elevation: 0,
        shadowColor: Colors.black,
        foregroundColor: Colors.black,
        leading: IconButton(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          icon: const Icon(Icons.close),
          color: Colors.black54,
          tooltip: MaterialLocalizations.of(context).closeButtonTooltip,
          onPressed: widget.action,
        ),
        toolbarHeight: 50,
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 10, right: 12.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  minimumSize: Size(110, 50),
                  primary: Theme.of(context).primaryColor),
              onPressed: () async {
                context.read<LoadingCubit>().startLoading();
                await widget.bloc.addEvent(_event.copyWith(
                    name: _nameController.text,
                    description: _controller.text,
                    url: _images.length > 0 ? _images[0].attachment!.url : null,
                    type: _selections[0]
                        ? EventType.training
                        : EventType.competition));
                context.read<LoadingCubit>().stopLoading();
                widget.action();
              },
              child: BlocBuilder<LoadingCubit, bool>(
                builder: (context, state) {
                  if (state)
                    return SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        color: Colors.white,
                        strokeWidth: 2,
                      ),
                    );
                  return Text('Сохранить');
                },
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ToggleButtons(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('тренировка'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('событие'),
                )
              ],
              borderRadius: BorderRadius.circular(6),
              isSelected: _selections,
              onPressed: (index) {
                setState(() {
                  _selections[index] = true;
                  _selections[1 - index] = false;
                });
              },
            ),
          ),
          ..._buildTrainingForm()
        ],
      )),
    );
  }

  List<Widget> _buildEventForm() {
    return [];
  }

  List<Widget> _buildTrainingForm() {
    return [
      Padding(
          padding: const EdgeInsets.only(left: 60),
          child: TextField(
            controller: _nameController,
            maxLines: null,
            style: TextStyle(fontSize: 28),
            decoration: InputDecoration(
              // style
              border: InputBorder.none,
              hintText: 'Название',
            ),
          )),
      Divider(
        thickness: 0.87,
      ),
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 12),
            child: Icon(Icons.calendar_today),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text('дата начала: '),
                  TextButton(
                      style: TextButton.styleFrom(
                          primary: Colors.black, padding: EdgeInsets.zero),
                      onPressed: () async {
                        final res = await showDatePicker(
                            locale: Locale('ru'),
                            context: context,
                            initialDate: DateTime.now(),
                            lastDate:
                                DateTime.now().add(Duration(days: 365 * 2)),
                            firstDate: DateTime.now()
                                .subtract(Duration(days: 365 * 2)));
                        print(res);
                        if (res != null) {
                          setState(() {
                            _event = _event.copyWith(date: res);
                          });
                        }
                      },
                      child: Text(Format.of(context)!.format(_event.date))),
                ],
              ),
              if (_selections[0])
                Row(
                  children: [
                    Text('каждые: '),
                    Builder(
                      builder: (context) => TextButton(
                          style: TextButton.styleFrom(
                              primary: Colors.black, padding: EdgeInsets.zero),
                          onPressed: () async {
                            showMaterialModalBottomSheet(
                              context: context,
                              builder: (context) => SafeArea(
                                top: false,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    ListTile(
                                      onTap: () {
                                        setState(() {
                                          _event = _event.copyWith(
                                              periodic:
                                                  Duration(days: 1).inHours);
                                          _durationText = 'каждый день';
                                        });
                                        Navigator.of(context).pop();
                                      },
                                      title: Text('каждый день'),
                                    ),
                                    ListTile(
                                      onTap: () {
                                        setState(() {
                                          _event = _event.copyWith(
                                              periodic:
                                                  Duration(days: 7).inHours);
                                          _durationText = '1 неделя';
                                        });
                                        Navigator.of(context).pop();
                                      },
                                      title: Text('1 неделя'),
                                    ),
                                    ListTile(
                                      onTap: () {
                                        setState(() {
                                          _event = _event.copyWith(
                                              periodic:
                                                  Duration(days: 14).inHours);
                                          _durationText = '2 недели';
                                        });
                                        Navigator.of(context).pop();
                                      },
                                      title: Text('2 недели'),
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                          child: Text(_durationText)),
                    ),
                  ],
                )
            ],
          ),
        ],
      ),
      Divider(
        thickness: 0.87,
      ),
      Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Icon(Icons.schedule_outlined),
          ),
          TextButton(
              style: TextButton.styleFrom(
                  alignment: Alignment.centerLeft,
                  primary: Colors.black,
                  padding: EdgeInsets.zero),
              onPressed: () async {
                final res = await showTimePicker(
                    initialEntryMode: TimePickerEntryMode.input,
                    builder: (context, child) => Localizations.override(
                          context: context,
                          locale: Locale('ru'),
                          child: MediaQuery(
                            data: MediaQuery.of(context)
                                .copyWith(alwaysUse24HourFormat: true),
                            child: child!,
                          ),
                        ),
                    context: context,
                    initialTime: TimeOfDay.fromDateTime(_event.date));
                print(res);
                if (res != null) {
                  setState(() {
                    final oldDate = _event.date;
                    final newDate = DateTime(oldDate.year, oldDate.month,
                        oldDate.day, res.hour, res.minute, 0);
                    _event = _event.copyWith(date: newDate.toUtc());
                  });
                }
              },
              child: Text('Время начала: ' +
                  Format.of(context)!.formatTime(_event.date))),
        ],
      ),
      Divider(
        thickness: 0.87,
      ),
      Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Icon(Icons.schedule_outlined),
          ),
          TextButton(
              style: TextButton.styleFrom(
                  alignment: Alignment.centerLeft,
                  primary: Colors.black,
                  padding: EdgeInsets.zero),
              onPressed: () async {
                final res = await showTimePicker(
                    initialEntryMode: TimePickerEntryMode.input,
                    builder: (context, child) => Localizations.override(
                          context: context,
                          locale: Locale('ru'),
                          child: MediaQuery(
                            data: MediaQuery.of(context)
                                .copyWith(alwaysUse24HourFormat: true),
                            child: child!,
                          ),
                        ),
                    context: context,
                    initialTime: TimeOfDay(minute: 30, hour: 1));
                print(res);
                if (res != null) {
                  setState(() {
                    _event = _event.copyWith(
                        duration: Duration(hours: res.hour, minutes: res.minute)
                            .inMinutes);
                  });
                }
              },
              child: Text(
                  'Длительность: ${(_event.duration! ~/ 60).toString().padLeft(2, '0')}:${(_event.duration! % 60).toString().padLeft(2, '0')}')),
        ],
      ),
      Divider(
        thickness: 0.87,
      ),
      Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Icon(Icons.description_outlined),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: TextField(
                controller: _controller,
                maxLines: null,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Описание',
                ),
              ),
            ),
          ),
        ],
      ),
      Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Icon(Icons.image),
          ),
          Expanded(
            child: Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Wrap(
                  direction: Axis.horizontal,
                  children: [
                    _buildAttachments(),
                    if (_images.length == 0)
                      IconButton(onPressed: _pickFile, icon: Icon(Icons.add))
                  ],
                )),
          ),
        ],
      ),
    ];
  }

  void _pickFile() async {
    final res = await _picker.getImage(source: ImageSource.gallery);

    if (res != null) {
      var controller = AnimationController(
          vsync: this,
          duration: Duration(milliseconds: 1000),
          reverseDuration: Duration(milliseconds: 300));
      var animation = CurvedAnimation(
        parent: controller,
        curve: Curves.elasticOut,
        reverseCurve: Curves.easeOutBack,
      );
      Future.delayed(Duration(milliseconds: 250), () => controller.forward());
      final attachment = _SendingAttachment(
        file: File(res.path),
        uploaded: false,
        controller: controller,
        animation: animation,
      );
      setState(() {
        _images.add(attachment);
      });
      final url = await _storage.uploadFile(attachment.file,
          '/images' + attachment.file.path.split('/').join(''));
      setState(() {
        _images[_images.indexWhere((e) => e == attachment)].uploaded = true;
        _images[_images.indexWhere((e) => e == attachment)].attachment =
            Attachment(url: url, id: '123');
      });
    }
  }

  Widget _buildAttachments() {
    return Wrap(
      direction: Axis.horizontal,
      children: _images
          .map((attachment) => ScaleTransition(
                scale: attachment.animation as Animation<double>,
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: Stack(
                          children: [
                            Container(
                              height: 90,
                              width: 100,
                              child: _buildAttachment(attachment),
                            ),
                            attachment.uploaded
                                ? SizedBox()
                                : Positioned.fill(
                                    child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: CircularProgressIndicator(
                                          strokeWidth: 2,
                                        ),
                                      ),
                                    ),
                                  ),
                          ],
                        ),
                      ),
                      _buildRemoveButton(attachment),
                    ],
                  ),
                ),
              ))
          .toList(),
    );
  }

  Widget _buildAttachment(_SendingAttachment attachment) {
    return GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              // opaque: false,
              // fullscreenDialog: true,
              builder: (context) => ImagePage(
                  image: FileImage(attachment.file),
                  id: attachment.file.path)));
        },
        child: Hero(
          // tag: attachment.file.path,
          tag: 'widget.id',
          child: Image.file(attachment.file, fit: BoxFit.cover),
        ));
  }

  Positioned _buildRemoveButton(_SendingAttachment attachment) {
    return Positioned(
      height: 20,
      width: 20,
      top: -6,
      right: -6,
      child: RawMaterialButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        elevation: 1,
        highlightElevation: 0,
        focusElevation: 0,
        disabledElevation: 0,
        hoverElevation: 0,
        onPressed: () {
          attachment.controller.reverse().then((value) {
            attachment.controller.dispose();
            setState(() {
              _images.remove(attachment);
            });
          });
        },
        fillColor: Colors.grey.withOpacity(1),
        child: Center(
          child: Icon(Icons.close, size: 12, color: Colors.white),
        ),
      ),
    );
  }
}

class _SendingAttachment {
  File file;
  AnimationController controller;
  Animation animation;
  bool uploaded;
  Attachment? attachment;

  _SendingAttachment(
      {required this.file,
      this.uploaded = false,
      required this.controller,
      this.attachment,
      required this.animation});
}
