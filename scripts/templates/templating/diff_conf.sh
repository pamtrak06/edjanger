#/bin/bash
echo "compare web1 vs web2 production.properties..."
diff web1/production.properties web2/production.properties
echo "compare web1 vs web2 integration.properties..."
diff web1/integration.properties web2/integration.properties
echo "compare web1 vs web2 edjanger.template..."
diff web1/edjanger.template web2/edjanger.template
echo "compare web1 vs web2 edjanger.properties..."
diff web1/edjanger.properties web2/edjanger.properties
