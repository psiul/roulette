select count(ss.ss_item_sk)
from store_sales ss,item i
where ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 488 and ss.ss_hash <= 988 and i.i_hash >= 198 and i.i_hash <= 398
;
