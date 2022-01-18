select count(ss.ss_item_sk)
from store_sales ss,item i
where ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 642 and ss.ss_hash <= 842 and i.i_hash >= 280 and i.i_hash <= 780
;
