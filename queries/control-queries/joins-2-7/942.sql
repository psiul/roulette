select count(ss.ss_item_sk)
from store_sales ss,item i
where ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 750 and ss.ss_hash <= 950 and i.i_hash >= 359 and i.i_hash <= 859
;
