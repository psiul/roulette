select count(ss.ss_item_sk)
from store_sales ss,item i
where ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 242 and ss.ss_hash <= 742 and i.i_hash >= 517 and i.i_hash <= 717
;
