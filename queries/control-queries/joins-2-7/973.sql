select count(ss.ss_item_sk)
from store_sales ss,item i
where ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 14 and ss.ss_hash <= 214 and i.i_hash >= 457 and i.i_hash <= 957
;
