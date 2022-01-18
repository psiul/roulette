select count(ss.ss_item_sk)
from store_sales ss,item i
where ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 555 and ss.ss_hash <= 755 and i.i_hash >= 104 and i.i_hash <= 604
;
