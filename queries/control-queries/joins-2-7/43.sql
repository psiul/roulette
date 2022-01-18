select count(ss.ss_item_sk)
from store_sales ss,item i
where ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 543 and ss.ss_hash <= 743 and i.i_hash >= 92 and i.i_hash <= 592
;
