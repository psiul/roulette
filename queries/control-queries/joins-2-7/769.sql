select count(ss.ss_item_sk)
from store_sales ss,item i
where ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 137 and ss.ss_hash <= 637 and i.i_hash >= 572 and i.i_hash <= 772
;
