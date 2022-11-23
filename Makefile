
CC=gcc
AR=ar
LM = -lm
FLAGS= -Wall -g
MAIN=main.o
OBJECTSLOOP=basicClassification.o advancedClassificationLoop.o
OBJECTSREC=basicClassification.o advancedClassificationRecursion.o

all:  mains maindloop maindrec loops
loops: libclassloops.a
loopd: libclassloops.so
recursives: libclassrec.a
recursived: libclassrec.so

libclassloops.a : $(OBJECTSLOOP)
	$(AR) -rcs libclassloops.a $(OBJECTSLOOP)

libclassrec.a : $(OBJECTSREC)
	$(AR) -rcs libclassrec.a $(OBJECTSREC)

libclassrec.so : $(OBJECTSREC)
	$(CC) -shared -o libclassrec.so $(OBJECTSREC)

libclassloops.so : $(OBJECTSLOOP)
	$(CC) -shared -o libclassloops.so $(OBJECTSLOOP)

mains : $(MAIN) libclassrec.a
	$(CC) $(FLAGS) -o mains $(MAIN) libclassrec.a #$(LM)

maindloop: $(MAIN) libclassloops.so
	$(CC) $(FLAGS) -o maindloop $(MAIN) ./libclassloops.so #$(LM)

maindrec: $(MAIN) libclassrec.so
	$(CC) $(FLAGS) -o maindrec $(MAIN) ./libclassrec.so #$(LM)


main.o: main.c NumClass.h
	$(CC) $(FLAGS) -c main.c

basicClassification.o: basicClassification.c NumClass.h
	$(CC) $(FLAGS) -c basicClassification.c

advancedClassificationLoop.o: advancedClassificationLoop.c NumClass.h
	$(CC) $(FLAGS) -c advancedClassificationLoop.c

advancedClassificationRecursion.o: advancedClassificationRecursion.c NumClass.h
	$(CC) $(FLAGS) -c advancedClassificationRecursion.c

.PHONY: clean all

clean:
	rm -f *.o *.a *.so mains maindloop maindrec
