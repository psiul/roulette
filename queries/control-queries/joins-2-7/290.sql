select count(ss.ss_item_sk)
from store_sales ss,item i
where ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 92 and ss.ss_hash <= 592 and i.i_hash >= 158 and i.i_hash <= 358
;
