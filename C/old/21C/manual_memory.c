#include <stdlib.h>
#include <stdio.h>

int main() {
	int *intspace = malloc(3000*sizeof(int));
	
	for(int i = 0; i < 3000; i++) {
		intspace[i] = i;
	}
	
	FILE *cf = fopen("manual_memory.txt", "w");
	
	for(int i = 0; i < 3000; i++) fprintf(cf, "%i\n", intspace[i]);
	
	free(intspace);
	fclose(cf);
}