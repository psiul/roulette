select count(ss.ss_item_sk)
from store_sales ss,item i
where ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 560 and ss.ss_hash <= 760 and i.i_hash >= 333 and i.i_hash <= 833
;
