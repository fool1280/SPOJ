const fi='';
      fo='';
type mang=array[1..50000] of longint;
     x=record
        ia,ib,gt:longint;
        end;
var f,g:text;
    n,m,k,nheap:longint;
    a,b:mang;
    heap:array[1..50000] of x;
procedure Sort(var a:mang;l,r:longint);
var i,j,k,temp:longint;
begin
        i:=l;
        j:=r;
        k:=a[random(r-l+1)+l];
        repeat
                while a[i]<k do inc(i);
                while a[j]>k do dec(j);
                if i<=j then
                begin
                        temp:=a[i];
                        a[i]:=a[j];
                        a[j]:=temp;
                        inc(i);
                        dec(j);
                end;
        until i>j;
        if i<r then Sort(a,i,r);
        if l<j then Sort(a,l,j);
end;
procedure Doc;
var i:longint;
begin
        assign(f,fi);
        reset(f);
        read(f,n,m,k);
        for i:=1 to n do read(f,a[i]);
        for i:=1 to m do read(f,b[i]);
        Sort(a,1,n);
        close(f);
end;
procedure Swap(var a,b:x);
var temp:x;
begin
        temp:=a;
        a:=b;
        b:=temp;
end;
procedure UpHeap(v:longint);
var parent,child:longint;
begin
        child:=v;
        parent:=child div 2;
        while (parent>0) and (heap[child].gt<heap[parent].gt) do
        begin
                Swap(heap[parent],heap[child]);
                child:=parent;
                parent:=child div 2;
        end;
end;
procedure Pop;
var parent,child:longint;
begin
        heap[1]:=heap[nheap];
        dec(nheap);
        parent:=1;
        while (parent*2<=nheap) do
        begin
                child:=parent*2;
                if (child<nheap) and (heap[child].gt>heap[child+1].gt) then inc(child);
                if heap[child].gt>=heap[parent].gt then break;
                Swap(heap[child],heap[parent]);
                parent:=child;
        end;
end;
procedure MakeHeap;
var i,vta,vtb,t:longint;
begin
        for i:=1 to m do
        begin
                inc(nheap);
                heap[nheap].ia:=1;
                heap[nheap].ib:=i;
                heap[nheap].gt:=a[1]+b[i];
                UpHeap(nheap);
        end;
        assign(g,fo);
        rewrite(g);
        for i:=1 to k do
        begin
                vta:=heap[1].ia;
                vtb:=heap[1].ib;
                t:=heap[1].gt;
                writeln(g,t);
                Pop;
                if vta<n then
                begin
                        inc(nheap);
                        heap[nheap].ia:=vta+1;
                        heap[nheap].ib:=vtb;
                        heap[nheap].gt:=a[vta+1]+b[vtb];
                        UpHeap(nheap);
                end;
        end;
        close(g);
end;
begin
        Doc;
        MakeHeap;
end.
