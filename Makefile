

all: maindloop mains maindrec


maindrec: main.o libclassrec.so
	gcc -Wall -g main.o -L. -lclassrec -o maindrec

maindloop: main.o libclassloop.so
	gcc -Wall -g main.o -L. -lclassloops -o maindloop



loops: libclassloop.so


libclassloop.so: basicclassfunction.o advancedClassificationLoop.o
	#gcc -c -Wall -Werror -fPIC basicclassfunction.c advancedClassificationloop.c
	gcc -shared -Wall -o libclassloops.so advancedClassificationLoop.o basicclassfunction.o -lm


mains: mains.exe
mains.exe: main.o libclassrec.a
	gcc -Wall -g -o mains.exe main.o libclassrec.a

recursived: libclassrec.so
libclassrec.so: basicclassfunction.o  advancedClassificationRecursion.o
	#gcc -c -Wall -Werror -fPIC basicclassfunction.c  advancedClassificationRecursion.c
	gcc -shared -Wall -o libclassrec.so basicclassfunction.o  advancedClassificationRecursion.o -lm


recursives: libclassrec.a
libclassrec.a:  advancedClassificationRecursion.o basicclassfunction.o
	ar -rcs libclassrec.a  advancedClassificationRecursion.o basicclassfunction.o




loops: libclassloops.a
libclassloops.a: advancedClassificationLoop.o basicclassfunction.o
	ar -rcs libclassloops.a advancedClassificationLoop.o basicclassfunction.o


basicclassfunction.o: basicclassfunction.c
	gcc -Wall -g -c basicclassfunction.c



advancedClassificationLoop.o: advancedClassificationLoop.c
	gcc -Wall -g -c advancedClassificationLoop.c



advancedClassificationRecursion.o:  advancedClassificationRecursion.c
	gcc -Wall -g -c advancedClassificationRecursion.c

main.o: main.c
	gcc -Wall -g -c main.c


clean:
	rm -f *.o *.a *.so mains.exe maindloop maindrec

