#!/bin/bash
YADRA="1 2 4 6 8 12"
for j in $YADRA; do
	echo "тест с -j$j"
	sum=0
	for i in 1 2 3; do
		make clean >/dev/null 2>&1
		{ time make -j$j 2>&1; } 2>&1 | grep real
	done
done

