select count(ss.ss_item_sk)
from store_sales ss,item i
where ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 151 and ss.ss_hash <= 651 and i.i_hash >= 324 and i.i_hash <= 524
;
