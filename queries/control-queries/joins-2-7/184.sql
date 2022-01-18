select count(ss.ss_item_sk)
from store_sales ss,item i
where ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 83 and ss.ss_hash <= 583 and i.i_hash >= 294 and i.i_hash <= 494
;
