select count(ss.ss_item_sk)
from store_sales ss,item i
where ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 197 and ss.ss_hash <= 397 and i.i_hash >= 483 and i.i_hash <= 983
;
