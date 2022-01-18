select count(ss.ss_item_sk)
from store_sales ss,item i
where ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 24 and ss.ss_hash <= 524 and i.i_hash >= 785 and i.i_hash <= 985
;
