
OBJECTSLOOP=basicClassification.o advancedClassificationLoop.o
OBJECTSREC=basicClassification.o advancedClassificationRecursion.o

all:  mains maindloop maindrec loops
loops: libclassloops.a
loopd: libclassloops.so
recursives: libclassrec.a
recursived: libclassrec.so

libclassloops.a : $(OBJECTSLOOP)
	ar -rcs libclassloops.a $(OBJECTSLOOP)

libclassrec.a : $(OBJECTSREC)
	ar -rcs libclassrec.a $(OBJECTSREC)

libclassrec.so : $(OBJECTSREC)
	gcc -shared -o libclassrec.so $(OBJECTSREC)

libclassloops.so : $(OBJECTSLOOP)
	gcc -shared -o libclassloops.so $(OBJECTSLOOP)

mains : main.o libclassrec.a
	gcc -Wall -g -o mains main.o libclassrec.a 

maindloop: main.o libclassloops.so
	gcc -Wall -g -o maindloop main.o ./libclassloops.so 

maindrec: main.o libclassrec.so
	gcc -Wall -g -o maindrec main.o ./libclassrec.so 


main.o: main.c NumClass.h
	gcc -Wall -g -c main.c

basicClassification.o: basicClassification.c NumClass.h
	gcc -Wall -g -c basicClassification.c

advancedClassificationLoop.o: advancedClassificationLoop.c NumClass.h
	gcc -Wall -g -c advancedClassificationLoop.c

advancedClassificationRecursion.o: advancedClassificationRecursion.c NumClass.h
	gcc -Wall -g -c advancedClassificationRecursion.c

.PHONY: clean all

clean:
	rm -f *.o *.a *.so mains maindloop maindrec
