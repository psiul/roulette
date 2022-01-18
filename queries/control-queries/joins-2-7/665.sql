select count(ss.ss_item_sk)
from store_sales ss,item i
where ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 497 and ss.ss_hash <= 997 and i.i_hash >= 547 and i.i_hash <= 747
;
