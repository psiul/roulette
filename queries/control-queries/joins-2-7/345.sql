select count(ss.ss_item_sk)
from store_sales ss,item i
where ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 580 and ss.ss_hash <= 780 and i.i_hash >= 361 and i.i_hash <= 861
;
