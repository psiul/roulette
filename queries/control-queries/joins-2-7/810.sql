select count(ss.ss_item_sk)
from store_sales ss,item i
where ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 344 and ss.ss_hash <= 544 and i.i_hash >= 176 and i.i_hash <= 676
;
