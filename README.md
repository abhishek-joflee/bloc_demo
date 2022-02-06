# NOTES

## STREAMS

* `Foundation` of Bloc

* example is in Notes/stream_example.dart

## CUBIT

* Only one stream of **EMITTING STATES**

* Receiving `events` from UI as functions call back

## BLOC

* 2 streams of `EMITTING STATES` & `RECEIVING EVENTS` from UI

### CUBIT & Bloc

* Cubit is minimal version of bloc ( `bloc extends cubit` )

      ? WHEN TO USE WHAT
      => When simple counter like application
          ? use cubit (ex: call increment & decrement function when you need to )
          : use bloc (ex: get stream of internet connectivity & react accordingly )


      => forEX: weather app ( type location => get location list )

          ? what cubit & bloc will do

        cubit : calls the function every time when user hit the keyboard

        bloc : you can send event in every 3 sec OR
                you can send event when user stop typing OR
                you can send event when 4 letters are typed... etc

       = bloc is the best for this ex 2.

## Flutter Bloc Concepts

---------------------

### BlocProvider

* flutter widget

* also known as `dependency injection` widget

* create & **provide** bloc object to all it's children.

```dart
 BlocProvider(
    lazy: false // true by default
    create: ((BuildContext context) => BlocA()),
    child: Screen1(),
  ),
```

* handles THE CLOSING part of blocs **autometically**.

* if Screen1 has a child of Screen2, because of context is different,
    blocA object is `not accessible` in Screen2, for that,

```dart
BlocProvider.value(
  value: BlocProvider.of<BlocA>(context),
  child: Screen2(),
),
```

* BlocProvider.value `doesn't close the bloc object`,
    because Screen1 may still be needed !
