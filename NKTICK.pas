uses math;
const fi='';
      fo='';
var f,g:text;
    t,r,kq:array[1..60000] of longint;
    n:longint;
procedure XuLi;
var i:longint;
begin
        assign(f,fi);
        reset(f);
        read(f,n);
        for i:=1 to n do read(f,t[i]);
        for i:=1 to n-1 do read(f,r[i]);
        kq[1]:=t[1];
        kq[2]:=min(r[1],kq[1]+t[2]);
        for i:=3 to n do
        begin
                kq[i]:=min(kq[i-2]+r[i-1],kq[i-1]+t[i]);
        end;
        close(f);
        assign(g,fo);
        rewrite(g);
        write(g,kq[n]);
        close(g);
end;
begin
        XuLi;
end.
