const fi='';
      fo='';
var f,g:text;
    n,m,nheap,s:longint;
    free:array[1..30000] of boolean;
    x,y,gt:array[1..100000] of longint;
    a,c:array[1..200000] of longint;
    head:array[1..30001] of longint;
    d,pos,d2,f1,f2:array[1..30000] of int64;
    heap:array[1..30000] of longint;
    kq:array[1..30000] of longint;
procedure Doc;
var i,u,v,l:longint;
begin
        assign(f,fi);
        reset(f);
        readln(f,n,m);
        s:=0;
        for i:=1 to m do
        begin
                readln(f,u,v,l);
                x[i]:=u;
                y[i]:=v;
                gt[i]:=l;
                inc(head[u]);
                inc(head[v]);
        end;
        for i:=2 to n+1 do head[i]:=head[i-1]+head[i];
        for i:=1 to m do
        begin
                a[head[x[i]]]:=y[i];
                a[head[y[i]]]:=x[i];
                c[head[x[i]]]:=gt[i];
                c[head[y[i]]]:=gt[i];
                dec(head[x[i]]);
                dec(head[y[i]]);
        end;
        close(f);
end;
procedure UpHeap(v:longint);
var child,parent:longint;
begin
        child:=pos[v];
        if child=0 then
        begin
                inc(nheap);
                child:=nheap;
        end;
        parent:=child div 2;
        while (parent>0) and (d[heap[parent]]>d[v]) do
        begin
                heap[child]:=heap[parent];
                pos[heap[child]]:=child;
                child:=parent;
                parent:=child div 2;
        end;
        heap[child]:=v;
        pos[v]:=child;
end;
function PopHeap:longint;
var parent,child,v:longint;
begin
        PopHeap:=heap[1];
        v:=heap[nheap];
        dec(nheap);
        parent:=1;
        while parent*2<=nheap do
        begin
                child:=parent*2;
                if (child<nheap) and (d[heap[child]]<d[heap[child+1]]) then inc(child);
                if d[heap[child]]>=d[v] then break;
                heap[parent]:=heap[child];
                pos[heap[parent]]:=parent;
                parent:=child;
        end;
        heap[parent]:=v;
        pos[v]:=parent;
end;
procedure UpHeap2(v:longint);
var child,parent:longint;
begin
        child:=pos[v];
        if child=0 then
        begin
                inc(nheap);
                child:=nheap;
        end;
        parent:=child div 2;
        while (parent>0) and (d2[heap[parent]]>d2[v]) do
        begin
                heap[child]:=heap[parent];
                pos[heap[child]]:=child;
                child:=parent;
                parent:=child div 2;
        end;
        heap[child]:=v;
        pos[v]:=child;
end;
function PopHeap2:longint;
var parent,child,v:longint;
begin
        PopHeap2:=heap[1];
        v:=heap[nheap];
        dec(nheap);
        parent:=1;
        while parent*2<=nheap do
        begin
                child:=parent*2;
                if (child<nheap) and (d2[heap[child]]<d2[heap[child+1]]) then inc(child);
                if d2[heap[child]]>=d2[v] then break;
                heap[parent]:=heap[child];
                pos[heap[parent]]:=parent;
                parent:=child;
        end;
        heap[parent]:=v;
        pos[v]:=parent;
end;
procedure Dijkstra;
var i,u,j:longint;
begin
        for i:=1 to n do
        begin
                free[i]:=true;
                f1[i]:=0;
                d[i]:=maxlongint;
                pos[i]:=0;
        end;
        d[1]:=0;
        f1[1]:=1;
        nheap:=0;
        UpHeap(1);
        repeat
                u:=PopHeap;
                free[u]:=false;
                for j:=head[u]+1 to head[u+1] do
                begin
                        i:=a[j];
                        if (free[i]) and (d[i]>d[u]+c[j]) then
                        begin
                                d[i]:=d[u]+c[j];
                                f1[i]:=f1[u];
                                UpHeap(i);
                        end
                        else
                        if (free[i]) and (d[i]=d[u]+c[j]) then f1[i]:=f1[i]+f1[u];
                end;
        until nheap=0;
        for i:=1 to n do
        begin
                free[i]:=true;
                d2[i]:=maxlongint;
                f2[i]:=0;
                pos[i]:=0;
        end;
        d2[n]:=0;
        f2[n]:=1;
        nheap:=0;
        UpHeap2(n);
        repeat
                u:=PopHeap2;
                free[u]:=false;
                for j:=head[u]+1 to head[u+1] do
                begin
                        i:=a[j];
                        if (free[i]) and (d2[i]>d2[u]+c[j]) then
                        begin
                                d2[i]:=d2[u]+c[j];
                                f2[i]:=f2[u];
                                UpHeap2(i);
                        end
                        else
                        if (free[i]) and (d2[i]=d2[u]+c[j]) then f2[i]:=f2[i]+f2[u];
                end;
        until nheap=0;
        assign(g,fo);
        rewrite(g);
        for i:=1 to n do
        begin
                if (d[i]+d2[i]<>d[n]) or (f1[i]*f2[i]<>f1[n]) then
                begin
                        inc(s);
                        kq[s]:=i;
                end;
        end;
        writeln(g,s);
        for i:=1 to s do writeln(g,kq[i]);
        close(g);
end;
begin
        Doc;
        Dijkstra;
end.