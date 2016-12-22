const fi='';
      fo='';
var f,g:text;
    a,d:array[1..100000] of qword;
    n,k:longint;
procedure Doc;
var i,c:longint;
begin
        assign(f,fi);
        reset(f);
        read(f,n,k);
        fillchar(a,sizeof(a),0);
        fillchar(d,sizeof(d),0);
        for i:=1 to k do
        begin
                read(f,c);
                d[c]:=1;
        end;
        close(f);
end;
procedure XuLi;
var i:longint;
begin
        a[1]:=1;
        if d[2]=0 then a[2]:=1 else a[2]:=0;
        for i:=3 to n do
        begin
                if (d[i]=0) then a[i]:=(a[i-1]+a[i-2]) mod 14062008 else a[i]:=0;
        end;
        assign(g,fo);
        rewrite(g);
        write(g,a[n]);
        close(g);
end;
begin
        Doc;
        XuLi;
end.