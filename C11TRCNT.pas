const fi='C11TRCNT.INP';
      fo='C11TRCNT.OUT';
var f,g:text;
    x,y:array[1..200] of longint;
    d:array[1..200] of longint;
    n,i,j,k:integer;
procedure Doc;
begin
        assign(f,fi);
        reset(f);
        readln(f,n);
        for i:=1 to n do read(f,x[i],y[i]);
        close(f);
end;
function kt(x1,x2,x3,y1,y2,y3:longint):boolean;
begin
        if x1*y3-x1*y2+x2*y1-x2*y3+x3*y2-x3*y1=0
        then exit(false) else exit(true);
end;
procedure XuLi;
var min,kq,t:longint;
begin
        for i:=1 to n do d[i]:=0;
        t:=0;
        min:=maxlongint;
        for i:=1 to n do
        begin
                for j:=1 to n do
                begin
                        if i<>j then
                        for k:=1 to n do
                        begin
                                if (i<>k) and (k<>j) and kt(x[i],x[j],x[k],y[i],y[j],y[k]) then
                                begin
                                        inc(d[i]);
                                        if (i<j) and (j<k) then inc(t); //tranh trung lap tinh i,j,k va i,k,j
                                end;
                        end;
                end;
                if d[i]<min then
                begin
                        min:=d[i];
                        kq:=i;
                end;
        end;
        assign(g,fo);
        rewrite(g);
        write(g,t,#32,kq);
        close(g);
end;
begin
        Doc;
        XuLi;
end.