select count(ss.ss_item_sk)
from store_sales ss,item i
where ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 117 and ss.ss_hash <= 617 and i.i_hash >= 395 and i.i_hash <= 595
;
