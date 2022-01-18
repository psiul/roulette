select count(ss.ss_item_sk)
from store_sales ss,item i
where ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 140 and ss.ss_hash <= 340 and i.i_hash >= 331 and i.i_hash <= 831
;
