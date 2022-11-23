
OBJECTSLOOP=basicclassfunction.o advancedClassificationLoop.o
OBJECTSREC=basicclassfunction.o advancedClassificationRecursion.o

all:  libclassrec.a libclassloops.a libclassloops.so libclassrec.so mains maindloop maindrec loops
recursives: libclassrec.a
recursived: libclassrec.so
loopd: libclassloops.so
loops: libclassloops.a





libclassloops.a : $(OBJECTSLOOP)
	ar -rcs libclassloops.a $(OBJECTSLOOP)

libclassrec.a : $(OBJECTSREC)
	ar -rcs libclassrec.a $(OBJECTSREC)

maindrec: main.o libclassrec.so
	gcc -Wall -g -o maindrec main.o ./libclassrec.so

libclassloops.so : $(OBJECTSLOOP)
	gcc -shared -o libclassloops.so $(OBJECTSLOOP)

mains : main.o libclassrec.a
	gcc -Wall -g -o mains main.o libclassrec.a

libclassrec.so : $(OBJECTSREC)
	gcc -shared -o libclassrec.so $(OBJECTSREC)

maindloop: main.o libclassloops.so
	gcc -Wall -g -o maindloop main.o ./libclassloops.so




main.o: main.c NumClass.h
	gcc -Wall -g -c main.c

advancedClassificationRecursion.o: advancedClassificationRecursion.c NumClass.h
	gcc -Wall -g -c advancedClassificationRecursion.c
basicclassfunction.o: basicclassfunction.c NumClass.h
	gcc -Wall -g -c basicclassfunction.c

advancedClassificationLoop.o: advancedClassificationLoop.c NumClass.h
	gcc -Wall -g -c advancedClassificationLoop.c





.PHONY: clean all

clean:
	rm -f *.o *.a *.so mains maindloop maindrec
