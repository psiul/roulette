select count(ss.ss_item_sk)
from store_sales ss,item i
where ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 397 and ss.ss_hash <= 897 and i.i_hash >= 674 and i.i_hash <= 874
;
