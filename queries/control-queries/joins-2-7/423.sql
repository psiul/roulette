select count(ss.ss_item_sk)
from store_sales ss,item i
where ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 44 and ss.ss_hash <= 544 and i.i_hash >= 542 and i.i_hash <= 742
;
