select count(ss.ss_item_sk)
from store_sales ss,item i
where ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 166 and ss.ss_hash <= 666 and i.i_hash >= 392 and i.i_hash <= 592
;
