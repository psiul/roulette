select count(ss.ss_item_sk)
from store_sales ss,item i
where ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 114 and ss.ss_hash <= 314 and i.i_hash >= 468 and i.i_hash <= 968
;
