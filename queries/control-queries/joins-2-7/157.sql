select count(ss.ss_item_sk)
from store_sales ss,item i
where ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 156 and ss.ss_hash <= 356 and i.i_hash >= 58 and i.i_hash <= 558
;
