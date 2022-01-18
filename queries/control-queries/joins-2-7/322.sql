select count(ss.ss_item_sk)
from store_sales ss,item i
where ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 250 and ss.ss_hash <= 750 and i.i_hash >= 46 and i.i_hash <= 246
;
