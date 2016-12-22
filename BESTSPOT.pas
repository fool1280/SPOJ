const fi='';
      fo='';
var f,g:text;
    p,fn,c,front,back,sl:longint;
    x,y:array[1..8000] of longint;
    head:array[1..501] of longint;
    t:array[1..500,1..500] of longint;
    a:array[1..16000] of longint;
    fgt:array[1..500] of longint;
    d,q:array[1..500] of longint;
    free:array[1..500] of boolean;
    best:array[1..500] of longint;
procedure Doc;
var i,u,v,tg:longint;
begin
        assign(f,fi);
        reset(f);
        readln(f,p,fn,c);
        for i:=1 to fn do read(f,fgt[i]);
        for i:=1 to c do
        begin
                read(f,u,v,tg);
                t[u,v]:=tg;
                t[v,u]:=tg;
                x[i]:=u;
                y[i]:=v;
                inc(head[x[i]]);
                inc(head[y[i]]);
        end;
        for i:=2 to p+1 do head[i]:=head[i-1]+head[i];
        for i:=1 to c do
        begin
                a[head[x[i]]]:=y[i];
                a[head[y[i]]]:=x[i];
                dec(head[x[i]]);
                dec(head[y[i]]);
        end;
        close(f);
end;
function PopQueue:longint;
begin
        Popqueue:=q[front];
        if front=500 then front:=1 else inc(front);
        dec(sl);
end;
procedure PushQueue(v:longint);
begin
        inc(sl);
        if back=500 then back:=1 else inc(back);
        q[back]:=v;
end;
procedure SPFA(i:longint);
var j,u,v:longint;
begin
        for j:=1 to p do
        begin
                free[j]:=true;
                d[j]:=maxlongint;
        end;
        front:=1;
        back:=1;
        q[1]:=i;
        free[1]:=false;
        sl:=1;
        d[i]:=0;
        repeat
                u:=PopQueue;
                free[u]:=true;
                for v:=head[u]+1 to head[u+1] do
                begin
                        j:=a[v];
                        if d[u]+t[u,j]<d[j] then
                        begin
                                d[j]:=d[u]+t[u,j];
                                if free[j] then
                                begin
                                        PushQueue(j);
                                        free[j]:=false;
                                end;
                        end;
                end;
        until sl=0;
        for j:=1 to fn do best[i]:=best[i]+d[fgt[j]];
end;
procedure XuLi;
var i,min:longint;
begin
        for i:=1 to p do SPFA(i);
        min:=1;
        for i:=2 to p do if best[i]<best[min] then min:=i;
        assign(g,fo);
        rewrite(g);
        write(g,min);
        close(g);
end;
begin
        Doc;
        XuLi;
end.