select count(ss.ss_item_sk)
from store_sales ss,item i
where ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 408 and ss.ss_hash <= 908 and i.i_hash >= 685 and i.i_hash <= 885
;
