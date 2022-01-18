select count(ss.ss_item_sk)
from store_sales ss,item i
where ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 207 and ss.ss_hash <= 707 and i.i_hash >= 379 and i.i_hash <= 579
;
