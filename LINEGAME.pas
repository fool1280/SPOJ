uses math;
const fi='';
      fo='';
var f,g:text;
    a:array[1..1000000] of longint;
    n,fp1,fp2,fs1,fs2:int64;
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
var i:longint;
begin
        fp1:=a[1];
        fs1:=0;
        for i:=2 to n do
        begin
                fp2:=max(fp1,fs1+a[i]);
                fs2:=max(fs1,fp1-a[i]);
                fp1:=fp2;
                fs1:=fs2;
        end;
        assign(g,fo);
        rewrite(g);
        write(g,max(fs1,fp1));
        close(g);
end;
begin
        Doc;
        XuLi;
end.
