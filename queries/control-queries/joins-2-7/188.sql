select count(ss.ss_item_sk)
from store_sales ss,item i
where ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 66 and ss.ss_hash <= 566 and i.i_hash >= 642 and i.i_hash <= 842
;
