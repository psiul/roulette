select count(ss.ss_item_sk)
from store_sales ss,item i
where ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 424 and ss.ss_hash <= 924 and i.i_hash >= 106 and i.i_hash <= 306
;
