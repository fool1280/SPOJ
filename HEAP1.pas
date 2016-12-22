const fi='';
      fo='';
var t,n,nheap:longint;
    a,heap:array[1..20000] of int64;
    f,g:text;
procedure Update(x:int64);
var parent,child:longint;
begin
        inc(nheap);
        child:=nheap;
        parent:=child div 2;
        while (parent>0) and (heap[parent]>x) do
        begin
                heap[child]:=heap[parent];
                child:=parent;
                parent:=child div 2;
        end;
        heap[child]:=x;
end;
function Pop:int64;
var parent,child,x:longint;
begin
        Pop:=heap[1];
        x:=heap[nheap];
        heap[nheap]:=0;
        dec(nheap);
        parent:=1;
        while parent*2<=nheap do
        begin
                child:=parent*2;
                if (child<nheap) and (heap[child]>heap[child+1]) then inc(child);
                if heap[child]>=x then break;
                heap[parent]:=heap[child];
                parent:=child;
        end;
        heap[parent]:=x;
end;
procedure Doc;
var i,j:longint;
    x,y,kq:int64;
begin
        assign(f,fi);
        reset(f);
        readln(f,t);
        assign(g,fo);
        rewrite(g);
        for i:=1 to t do
        begin
                readln(f,n);
                nheap:=0;
                kq:=0;
                for j:=1 to n do
                begin
                        read(f,a[j]);
                        Update(a[j]);
                end;
                for j:=1 to nheap-1 do
                begin
                        x:=Pop;
                        y:=Pop;
                        kq:=kq+(x+y);
                        Update(x+y);
                end;
                writeln(g,kq);
                readln(f);
        end;
        close(f);
        close(g);
end;
begin
        Doc;
end.