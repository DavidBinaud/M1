
#include <stdio.h>

int main(int argc, char *argv[])
{
	int a = 10;
	int b = 25;
	int* p = &b;
	int* pp = &a;

	if(argc > 1){
		switch(*argv[1]){
			case '1':
			    printf("%d\n", *(&(*(*(&p)))));
				break;
			case '2':
			    printf("%d\n", *(p-1));
				break;
			case '3':
			    printf("%d\n", *(*(&p)-1));
				break;
			case '4':
			    printf("%d\n", *(*(&pp)+1));
				break;
			case '5':
			    printf("%d\n", *(&(*(*(&p)))-1));
				break;
			case '6':
			    printf("%d\n", *(&(*(*(&p)))+1));
				break;
			default:
				printf("Pas d'argument valable\n");
				break;
		}

	}

    return 0;
}