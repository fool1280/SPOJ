const fi='';
      fo='';
var f,g:text;
    n:longint;
    a,l:array[1..1000] of longint;
procedure Doc;
var i:longint;
begin
        assign(f,fi);
        reset(f);
        read(f,n);
        for i:=1 to n do read(f,a[i]);
        close(f);
end;
procedure XuLi;
var i,j,max:longint;
begin
        max:=0;
        for i:=1 to n do
        begin
                l[i]:=1;
                for j:=i-1 downto 1 do
                if (a[j]<a[i]) and (l[i]<l[j]+1) then l[i]:=l[j]+1;
                if l[i]>max then max:=l[i];
        end;
        assign(g,fo);
        rewrite(g);
        write(g,max);
        close(g);
end;
begin
        Doc;
        XuLi;
end.