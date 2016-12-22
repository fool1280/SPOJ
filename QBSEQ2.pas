const fi='';
      fo='';
var f,g:text;
    count:array[0..50] of longint;
    trace,kq:array[0..50,0..50] of longint;
    a:array[1..1000] of longint;
    n,k:longint;
procedure Doc;
var i:longint;
begin
        assign(f,fi);
        reset(f);
        read(f,n,k);
        fillchar(count,sizeof(count),0);
        fillchar(kq,sizeof(kq),0);
        for i:=1 to n do
        begin
                read(f,a[i]);
                inc(count[a[i] mod k]);
        end;
        close(f);
end;
function Sub(x,y:longint):longint;
var tmp:longint;
begin
        tmp:=(x-y) mod k;
        if tmp>=0 then Sub:=tmp else Sub:=tmp+k;
end;
procedure XuLi;
var i,j,t,tmp:longint;
begin
        kq[0,0]:=count[0];
        fillchar(trace,sizeof(trace),$FF);
        trace[0,0]:=count[0];
        for i:=1 to k-1 do
        for t:=0 to k-1 do
        begin
                kq[i,t]:=kq[i-1,t];
                trace[i,t]:=trace[i-1,t];
                for j:=0 to count[i] do
                begin
                        tmp:=Sub(t,j*i);
                        if (trace[i-1,tmp]<>-1) and
                        (kq[i-1,tmp]+j>kq[i,t]) then
                        begin
                                kq[i,t]:=kq[i-1,tmp]+j;
                                trace[i,t]:=j;
                        end;
                end;
        end;
        assign(g,fo);
        rewrite(g);
        writeln(g,kq[k-1,0]);
        close(g);
end;
begin
        Doc;
        XuLi;
end.
