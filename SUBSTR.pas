const fi='SUBSTR.INP';
      fo='SUBSTR.OUT';
var a,b:ansistring;
    next:array[1..1000000] of longint;
    i,j,jj:longint;
    f,g:text;
procedure Doc;
begin
        assign(f,fi);
        reset(f);
        readln(f,a);
        readln(f,b);
	a:=a+#32;
	b:=b+#32;
        close(f);
end;
procedure Init;
var j,jj,i:longint;
begin
        j:=1;
        jj:=0;
        next[1]:=0;
        while j<=length(b)-1 do
        begin
                while (jj>0) and (b[j]<>b[jj]) do jj:=next[jj];
                inc(j);
                inc(jj);
                if b[j]=b[jj] then next[j]:=next[jj] else next[j]:=jj;
        end;
        i:=1;
        j:=1;
        assign(g,fo);
        rewrite(g);
        repeat
                while (j>0) and (b[j]<>a[i]) do j:=next[j];
                inc(i);
                inc(j);
                if j>length(b)-1 then
                begin
                        write(g,i-j+1,#32);
                        j:=next[j];
                end;
        until i>length(a)-1;
        close(g);
end;
begin
        Doc;
        Init;
end.
