const fi='';
      fo='';
var f,g:text;
    n,m:longint;
    a:array[1..1000] of longint;
procedure Doc;
var i:longint;
begin
        assign(f,fi);
        reset(f);
        read(f,n,m);
        for i:=1 to m do read(f,a[i]);
        close(f);
end;
function sum(i:longint):qword;
begin
        if m-i+1>n then exit(a[i]*n)
        else exit(a[i]*(m-i+1));
end;
procedure XuLi;
var i,j,temp,vt:longint;
    max:qword;
begin
        for i:=1 to m-1 do
        begin
                for j:=i+1 to m do
                begin
                        if a[i]>a[j] then
                        begin
                                temp:=a[i];
                                a[i]:=a[j];
                                a[j]:=temp;
                        end;
                end;
        end;
        max:=0;
        vt:=0;
        for i:=1 to m do
        begin
                if Sum(i)>max then
                begin
                        max:=sum(i);
                        vt:=i;
                end;
        end;
        assign(g,fo);
        rewrite(g);
        write(g,a[vt],#32,max);
        close(g);
end;
begin
        Doc;
        XuLi;
end.