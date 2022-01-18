select count(ss.ss_item_sk)
from store_sales ss,item i
where ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 134 and ss.ss_hash <= 634 and i.i_hash >= 663 and i.i_hash <= 863
;
