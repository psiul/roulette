select count(ss.ss_item_sk)
from store_sales ss,item i
where ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 188 and ss.ss_hash <= 688 and i.i_hash >= 476 and i.i_hash <= 676
;
