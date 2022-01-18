select count(ss.ss_item_sk)
from store_sales ss,item i
where ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 64 and ss.ss_hash <= 264 and i.i_hash >= 356 and i.i_hash <= 856
;
