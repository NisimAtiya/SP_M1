

all: maindloop mains maindrec libclassloops.a libclassloop.so libclassrec.a libclassrec.so


maindrec: main.o libclassrec.so
	gcc -Wall -g -o maindrec main.o ./libclassrec.so

maindloop: main.o libclassloop.so
	gcc -Wall -g -o maindloop main.o ./libclassloop.so



loopd: libclassloop.so


libclassloop.so: basicclassfunction.o advancedClassificationLoop.o
	#gcc -c -Wall -Werror -fPIC basicclassfunction.c advancedClassificationloop.c
	gcc -shared -Wall -o libclassloops.so advancedClassificationLoop.o basicclassfunction.o



mains: main.o libclassrec.a
	gcc -Wall -g -o mains main.o libclassrec.a

recursived: libclassrec.so
libclassrec.so: basicclassfunction.o  advancedClassificationRecursion.o
	#gcc -c -Wall -Werror -fPIC basicclassfunction.c  advancedClassificationRecursion.c
	gcc -shared -Wall -o libclassrec.so basicclassfunction.o  advancedClassificationRecursion.o


recursives: libclassrec.a
libclassrec.a:  advancedClassificationRecursion.o basicclassfunction.o
	ar -rcs libclassrec.a  advancedClassificationRecursion.o basicclassfunction.o




loops: libclassloops.a
libclassloops.a: advancedClassificationLoop.o basicclassfunction.o
	ar -rcs libclassloops.a advancedClassificationLoop.o basicclassfunction.o


basicclassfunction.o: basicclassfunction.c NumClass.h
	gcc -Wall -g -c basicclassfunction.c



advancedClassificationLoop.o: advancedClassificationLoop.c NumClass.h
	gcc -Wall -g -c advancedClassificationLoop.c



advancedClassificationRecursion.o:  advancedClassificationRecursion.c NumClass.h
	gcc -Wall -g -c advancedClassificationRecursion.c

main.o: main.c NumClass.h
	gcc -Wall -g -c main.c


clean:
	rm -f *.o *.a *.so mains maindloop maindrec

